% Run these tests with runMyTests
% All tests so far are on code expected to run without errors
% If/when we end up with a version that _should_ error, 
% please add it to this set of examples
classdef smokeTests < matlab.unittest.TestCase

    properties
        fc
    end

    methods (TestClassSetup)

        function setUpPath(testCase)
            testCase.fc = fullfile(pwd);
            rootDirName = extractBefore(testCase.fc,"tests");
            addpath(rootDirName)
        end

    end % methods (TestClassSetup)

    methods(Test)

        function runPart0(testCase)
            testCase.log("Running ConceptReview.m")
            run("ConceptReview.m")
        end

        function runPart0Soln(testCase)
            testCase.log("Running ConceptReviewSoln.m")
            run("ConceptReviewSoln.m")
        end

        function runPart1(testCase)
            testCase.log("Running TransferFunctionBasics.m")
            run("TransferFunctionBasics.m")
        end

        function runPart1Soln(testCase)
            testCase.log("Running TransferFunctionBasicsSoln.m")
            run("TransferFunctionBasicsSoln.m")
        end

        function runPart2(testCase)
            testCase.log("Running PoleZeroAnalysis.m")
            run("PoleZeroAnalysis.m")
        end

        function runPart2Soln(testCase)
            testCase.log("Running PoleZeroAnalysisSoln.m")
            run("PoleZeroAnalysisSoln.m")
        end

        function runPart3(testCase)
            testCase.log("Running FrequencyDomainAnalysis.m")
            run("FrequencyDomainAnalysis.m")
        end

        function runPart3Soln(testCase)
            testCase.log("Running FrequencyDomainAnalysisSoln.m")
            run("FrequencyDomainAnalysisSoln.m")
        end

    end

    methods (TestClassTeardown)

        function resetPath(testCase)
            cd(testCase.fc)
        end

    end % methods (TestClassTeardown)

end