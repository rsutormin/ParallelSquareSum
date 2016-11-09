/*
A KBase module: ParallelSquareSum
*/

module ParallelSquareSum {

    /* ===================== main ===================== */

    typedef structure {
        int n;
    } CalcSquareSumParams;

    typedef structure {
        int square_sum;
    } CalcSquareSumInputOutput;

    funcdef calcSquareSum(CalcSquareSumParams params) 
        returns (CalcSquareSumInputOutput) authentication required;


    /* ===================== prepare ===================== */

    typedef structure {
        string module_name;
        string method_name;
        string service_ver;
    } FullMethodQualifier;
    
    typedef structure {
        FullMethodQualifier global_method;
        CalcSquareSumParams global_input_params;
    } CalcSquareSumPrepareParams;

    typedef structure {
        int i;
    } CalcSquareSumTask;
    
    typedef structure {
        FullMethodQualifier method;
        tuple<CalcSquareSumTask> input_arguments;
    } CalcSquareSumRunEachInput;

    typedef structure {
        list<CalcSquareSumRunEachInput> tasks;
        FullMethodQualifier collect_method;
    } CalcSquareSumPrepareSchedule;

    funcdef calcSquareSumPrepare(CalcSquareSumPrepareParams params) returns (CalcSquareSumPrepareSchedule) authentication required;


    /* ===================== runEach ===================== */

    typedef structure {
        int i_squre;
    } CalcSquareSumRunEachOutput;

    funcdef calcSquareSumRunEach(CalcSquareSumTask task) returns (CalcSquareSumRunEachOutput) authentication required;


    /* ===================== collect ===================== */

    typedef structure {
        CalcSquareSumRunEachInput input;
        CalcSquareSumRunEachOutput result;
    } CalcSquareSumInputResultPair;

    typedef structure {
        CalcSquareSumParams global_params;
        list<CalcSquareSumInputResultPair> input_result_pairs;
    } CalcSquareSumCollectInput;

    funcdef calcSquareSumCollect(CalcSquareSumCollectInput params) 
        returns (CalcSquareSumInputOutput) authentication required;

};
