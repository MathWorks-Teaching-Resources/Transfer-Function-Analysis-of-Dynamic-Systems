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
            testCase.log("Running Part0_ConceptReview.mlx")
            run("Part0_ConceptReview.mlx")
        end

        function runPart0Soln(testCase)
            testCase.log("Running Part0_ConceptReviewSoln.mlx")
            run("Part0_ConceptReviewSoln.mlx")
        end

        function runPart1(testCase)
            testCase.log("Running Part1_TransferFunctionBasics.mlx")
            run("Part1_TransferFunctionBasics.mlx")
        end

        function runPart1Soln(testCase)
            testCase.log("Running Part1_TransferFunctionBasicsSoln.mlx")
            run("Part1_TransferFunctionBasicsSoln.mlx")
        end

        function runPart2(testCase)
            testCase.log("Running Part2_PoleZeroAnalysis.mlx")
            run("Part2_PoleZeroAnalysis.mlx")
        end

        function runPart2Soln(testCase)
            testCase.log("Running Part2_PoleZeroAnalysisSoln.mlx")
            run("Part2_PoleZeroAnalysisSoln.mlx")
        end

        function runPart3(testCase)
            testCase.log("Running Part3_FrequencyDomainAnalysis.mlx")
            run("Part3_FrequencyDomainAnalysis.mlx")
        end

        function runPart3Soln(testCase)
            testCase.log("Running Part3_FrequencyDomainAnalysisSoln.mlx")
            run("Part3_FrequencyDomainAnalysisSoln.mlx")
        end

    end

    methods (TestClassTeardown)

        function resetPath(testCase)
            cd(testCase.fc)
        end

    end % methods (TestClassTeardown)

end