# -*- coding: utf-8 -*-
#BEGIN_HEADER
import os
from KBParallel.KBParallelClient import KBParallel
#END_HEADER


class ParallelSquareSum:
    '''
    Module Name:
    ParallelSquareSum

    Module Description:
    A KBase module: ParallelSquareSum
    '''

    ######## WARNING FOR GEVENT USERS ####### noqa
    # Since asynchronous IO can lead to methods - even the same method -
    # interrupting each other, you must be *very* careful when using global
    # state. A method could easily clobber the state set by another while
    # the latter method is running.
    ######################################### noqa
    VERSION = "0.0.1"
    GIT_URL = ""
    GIT_COMMIT_HASH = ""

    #BEGIN_CLASS_HEADER
    #END_CLASS_HEADER

    # config contains contents of config file in a hash or None if it couldn't
    # be found
    def __init__(self, config):
        #BEGIN_CONSTRUCTOR
        #END_CONSTRUCTOR
        pass


    def calcSquareSum(self, ctx, params):
        """
        :param params: instance of type "CalcSquareSumParams"
           (===================== main =====================) -> structure:
           parameter "n" of Long
        :returns: instance of type "CalcSquareSumInputOutput" -> structure:
           parameter "square_sum" of Long
        """
        # ctx is the context object
        # return variables are: returnVal
        #BEGIN calcSquareSum
        kbp = KBParallel(os.environ['SDK_CALLBACK_URL'], token=ctx['token'])
        returnVal = kbp.run({'prepare_method': {'module_name': 'ParallelSquareSum',
                                                'method_name': 'calcSquareSumPrepare',
                                                'service_ver': 'dev'},
                             'is_local': 1,
                             'global_params': params,
                             'time_limit': 1000000})
        #END calcSquareSum

        # At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method calcSquareSum return value ' +
                             'returnVal is not type dict as required.')
        # return the results
        return [returnVal]

    def calcSquareSumPrepare(self, ctx, params):
        """
        :param params: instance of type "CalcSquareSumPrepareParams" ->
           structure: parameter "global_method" of type "FullMethodQualifier"
           (===================== prepare =====================) ->
           structure: parameter "module_name" of String, parameter
           "method_name" of String, parameter "service_ver" of String,
           parameter "global_input_params" of type "CalcSquareSumParams"
           (===================== main =====================) -> structure:
           parameter "n" of Long
        :returns: instance of type "CalcSquareSumPrepareSchedule" ->
           structure: parameter "tasks" of list of type
           "CalcSquareSumRunEachInput" -> structure: parameter "method" of
           type "FullMethodQualifier" (===================== prepare
           =====================) -> structure: parameter "module_name" of
           String, parameter "method_name" of String, parameter "service_ver"
           of String, parameter "input_arguments" of tuple of size 1: type
           "CalcSquareSumTask" -> structure: parameter "i" of Long, parameter
           "collect_method" of type "FullMethodQualifier"
           (===================== prepare =====================) ->
           structure: parameter "module_name" of String, parameter
           "method_name" of String, parameter "service_ver" of String
        """
        # ctx is the context object
        # return variables are: returnVal
        #BEGIN calcSquareSumPrepare
        count = params['global_input_params']['n']
        tasks = [{'method': {'module_name': 'ParallelSquareSum',
                             'method_name': 'calcSquareSumRunEach',
                             'service_ver': 'dev'}, 
                  'input_arguments': [{'i': i + 1}]} for i in range(count)]
        returnVal = {'tasks': tasks, 
                     'collect_method': {'module_name': 'ParallelSquareSum',
                                        'method_name': 'calcSquareSumCollect',
                                        'service_ver': 'dev'}}
        #END calcSquareSumPrepare

        # At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method calcSquareSumPrepare return value ' +
                             'returnVal is not type dict as required.')
        # return the results
        return [returnVal]

    def calcSquareSumRunEach(self, ctx, task):
        """
        :param task: instance of type "CalcSquareSumTask" -> structure:
           parameter "i" of Long
        :returns: instance of type "CalcSquareSumRunEachOutput"
           (===================== runEach =====================) ->
           structure: parameter "i_squre" of Long
        """
        # ctx is the context object
        # return variables are: returnVal
        #BEGIN calcSquareSumRunEach
        i = task['i']
        returnVal = {'i_square': i * i}
        #END calcSquareSumRunEach

        # At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method calcSquareSumRunEach return value ' +
                             'returnVal is not type dict as required.')
        # return the results
        return [returnVal]

    def calcSquareSumCollect(self, ctx, params):
        """
        :param params: instance of type "CalcSquareSumCollectInput" ->
           structure: parameter "global_params" of type "CalcSquareSumParams"
           (===================== main =====================) -> structure:
           parameter "n" of Long, parameter "input_result_pairs" of list of
           type "CalcSquareSumInputResultPair" (===================== collect
           =====================) -> structure: parameter "input" of type
           "CalcSquareSumRunEachInput" -> structure: parameter "method" of
           type "FullMethodQualifier" (===================== prepare
           =====================) -> structure: parameter "module_name" of
           String, parameter "method_name" of String, parameter "service_ver"
           of String, parameter "input_arguments" of tuple of size 1: type
           "CalcSquareSumTask" -> structure: parameter "i" of Long, parameter
           "result" of type "CalcSquareSumRunEachOutput"
           (===================== runEach =====================) ->
           structure: parameter "i_squre" of Long
        :returns: instance of type "CalcSquareSumInputOutput" -> structure:
           parameter "square_sum" of Long
        """
        # ctx is the context object
        # return variables are: returnVal
        #BEGIN calcSquareSumCollect
        square_sum = 0
        for pair in params['input_result_pairs']:
            square_sum += pair['result']['i_square']
        returnVal = {'square_sum': square_sum}
        #END calcSquareSumCollect

        # At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method calcSquareSumCollect return value ' +
                             'returnVal is not type dict as required.')
        # return the results
        return [returnVal]
    def status(self, ctx):
        #BEGIN_STATUS
        returnVal = {'state': "OK",
                     'message': "",
                     'version': self.VERSION,
                     'git_url': self.GIT_URL,
                     'git_commit_hash': self.GIT_COMMIT_HASH}
        #END_STATUS
        return [returnVal]
