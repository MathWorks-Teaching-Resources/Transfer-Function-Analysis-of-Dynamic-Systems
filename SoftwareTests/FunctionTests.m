classdef FunctionTests < matlab.unittest.TestCase

    properties
        AppsPath string
    end

    methods(TestClassSetup)
        function addAppsPath(testCase)
            testFile = string(mfilename("fullpath"));
            projectRoot = extractBefore(testFile,"SoftwareTests");
            testCase.AppsPath = fullfile(projectRoot,"Apps");
            testCase.applyFixture(matlab.unittest.fixtures.PathFixture(testCase.AppsPath));
        end
    end

    methods(Test)
        function firstOrderPoleUsesStaticGain(testCase)
            sys = polesAppTransferFunction([-2 -2 -2 1 2 0],1,0,1);

            [num,den] = tfdata(sys,"v");
            num = stripLeadingZeros(num);

            testCase.verifyEqual(num,2,"AbsTol",1e-12)
            testCase.verifyEqual(den,[1 2],"AbsTol",1e-12)
            testCase.verifyEqual(dcgain(sys),1,"AbsTol",1e-12)
        end

        function fartherLeftPoleRespondsFaster(testCase)
            sysSlow = polesAppTransferFunction([-1 -2 -2 1 2 0],1,0,1);
            sysFast = polesAppTransferFunction([-2 -2 -2 1 2 0],1,0,1);

            sampleTimes = [0 0.5 1];
            slowResponse = squeeze(step(sysSlow,sampleTimes));
            fastResponse = squeeze(step(sysFast,sampleTimes));

            testCase.verifyGreaterThan(fastResponse(2),slowResponse(2))
            testCase.verifyEqual(dcgain(sysSlow),dcgain(sysFast),"AbsTol",1e-12)
        end

        function complexPolePairUsesStaticGain(testCase)
            sys = polesAppTransferFunction([-1+1i -2 -2 1 2 0],1,0,1);

            [num,den] = tfdata(sys,"v");
            num = stripLeadingZeros(num);

            testCase.verifyEqual(num,2,"AbsTol",1e-12)
            testCase.verifyEqual(den,[1 2 2],"AbsTol",1e-12)
            testCase.verifyEqual(dcgain(sys),1,"AbsTol",1e-12)
        end

        function integratorStepResponseIsRamp(testCase)
            sys = polesAppTransferFunction([0 -2 -2 1 2 0],1,0,1);

            [num,den] = tfdata(sys,"v");
            num = stripLeadingZeros(num);
            sampleTimes = [0 1 2];
            response = squeeze(step(sys,sampleTimes));

            testCase.verifyEqual(num,1,"AbsTol",1e-12)
            testCase.verifyEqual(den,[1 0],"AbsTol",1e-12)
            testCase.verifyEqual(response(:),sampleTimes(:),"AbsTol",1e-12)
        end

        function zeroAndPoleSystemUsesStaticGainWhenDefined(testCase)
            sys = polesAppTransferFunction([-2 -2 -2 1 2 0],1,1,3);

            testCase.verifyEqual(dcgain(sys),3,"AbsTol",1e-12)
        end
    end
end

function coefficients = stripLeadingZeros(coefficients)
firstNonzero = find(abs(coefficients) > 100*eps,1,"first");
if isempty(firstNonzero)
    coefficients = 0;
else
    coefficients = coefficients(firstNonzero:end);
end
end
