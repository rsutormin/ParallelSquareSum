# -*- coding: utf-8 -*-
############################################################
#
# Autogenerated by the KBase type compiler -
# any changes made here will be overwritten
#
############################################################

from __future__ import print_function
# the following is a hack to get the baseclient to import whether we're in a
# package or not. This makes pep8 unhappy hence the annotations.
try:
    # baseclient and this client are in a package
    from .baseclient import BaseClient as _BaseClient  # @UnusedImport
except:
    # no they aren't
    from baseclient import BaseClient as _BaseClient  # @Reimport


class ParallelSquareSum(object):

    def __init__(
            self, url=None, timeout=30 * 60, user_id=None,
            password=None, token=None, ignore_authrc=False,
            trust_all_ssl_certificates=False,
            auth_svc='https://kbase.us/services/authorization/Sessions/Login'):
        if url is None:
            raise ValueError('A url is required')
        self._service_ver = None
        self._client = _BaseClient(
            url, timeout=timeout, user_id=user_id, password=password,
            token=token, ignore_authrc=ignore_authrc,
            trust_all_ssl_certificates=trust_all_ssl_certificates,
            auth_svc=auth_svc)

    def calcSquareSum(self, params, context=None):
        """
        :param params: instance of type "CalcSquareSumParams"
           (===================== main =====================) -> structure:
           parameter "n" of Long
        :returns: instance of type "CalcSquareSumInputOutput" -> structure:
           parameter "square_sum" of Long
        """
        return self._client.call_method(
            'ParallelSquareSum.calcSquareSum',
            [params], self._service_ver, context)

    def calcSquareSumPrepare(self, params, context=None):
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
        return self._client.call_method(
            'ParallelSquareSum.calcSquareSumPrepare',
            [params], self._service_ver, context)

    def calcSquareSumRunEach(self, task, context=None):
        """
        :param task: instance of type "CalcSquareSumTask" -> structure:
           parameter "i" of Long
        :returns: instance of type "CalcSquareSumRunEachOutput"
           (===================== runEach =====================) ->
           structure: parameter "i_squre" of Long
        """
        return self._client.call_method(
            'ParallelSquareSum.calcSquareSumRunEach',
            [task], self._service_ver, context)

    def calcSquareSumCollect(self, params, context=None):
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
        return self._client.call_method(
            'ParallelSquareSum.calcSquareSumCollect',
            [params], self._service_ver, context)

    def status(self, context=None):
        return self._client.call_method('ParallelSquareSum.status',
                                        [], self._service_ver, context)
