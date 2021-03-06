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
import time


class KBParallel(object):

    def __init__(
            self, url=None, timeout=30 * 60, user_id=None,
            password=None, token=None, ignore_authrc=False,
            trust_all_ssl_certificates=False,
            auth_svc='https://kbase.us/services/authorization/Sessions/Login',
            service_ver='dev',
            async_job_check_time_ms=100, async_job_check_time_scale_percent=150, 
            async_job_check_max_time_ms=300000):
        if url is None:
            raise ValueError('A url is required')
        self._service_ver = service_ver
        self._client = _BaseClient(
            url, timeout=timeout, user_id=user_id, password=password,
            token=token, ignore_authrc=ignore_authrc,
            trust_all_ssl_certificates=trust_all_ssl_certificates,
            auth_svc=auth_svc,
            async_job_check_time_ms=async_job_check_time_ms,
            async_job_check_time_scale_percent=async_job_check_time_scale_percent,
            async_job_check_max_time_ms=async_job_check_max_time_ms)

    def _check_job(self, job_id):
        return self._client._check_job('KBParallel', job_id)

    def _run_submit(self, input_params, context=None):
        return self._client._submit_job(
             'KBParallel.run', [input_params],
             self._service_ver, context)

    def run(self, input_params, context=None):
        """
        :param input_params: instance of type "KBParallelrunInputParams"
           (Input parameters for run() method. method - optional method where
           _prepare(), _runEach() and _collect() suffixes are applied,
           prepare_method - optional method (if defined overrides _prepare
           suffix rule), is_local - optional flag defining way of scheduling
           sub-job, in case is_local=false sub-jobs are scheduled against
           remote execution engine, if is_local=true then sub_jobs are run as
           local functions through CALLBACK mechanism, default value is
           false, global_input - input data which is supposed to be sent as a
           part to <module_name>.<method_name>_prepare() method, time_limit -
           time limit in seconds, equals to 5000 by default.) -> structure:
           parameter "method" of type "FullMethodQualifier" (module_name -
           SDK module name (ie. ManyHellos, RNAseq), method_name - method in
           SDK module (TopHatcall, Hiseqcall etc each will have own
           _prepare(), _runEach(), _collect() methods defined), service_ver -
           optional version of SDK module (may be dev/beta/release, or
           symantic version or particular git commit hash), it's release by
           default,) -> structure: parameter "module_name" of String,
           parameter "method_name" of String, parameter "service_ver" of
           String, parameter "prepare_method" of type "FullMethodQualifier"
           (module_name - SDK module name (ie. ManyHellos, RNAseq),
           method_name - method in SDK module (TopHatcall, Hiseqcall etc each
           will have own _prepare(), _runEach(), _collect() methods defined),
           service_ver - optional version of SDK module (may be
           dev/beta/release, or symantic version or particular git commit
           hash), it's release by default,) -> structure: parameter
           "module_name" of String, parameter "method_name" of String,
           parameter "service_ver" of String, parameter "is_local" of type
           "boolean" (A boolean - 0 for false, 1 for true. @range (0, 1)),
           parameter "global_input" of unspecified object, parameter
           "time_limit" of Long
        :returns: instance of unspecified object
        """
        job_id = self._run_submit(input_params, context)
        async_job_check_time = self._client.async_job_check_time
        while True:
            time.sleep(async_job_check_time)
            async_job_check_time = (async_job_check_time *
                self._client.async_job_check_time_scale_percent / 100.0)
            if async_job_check_time > self._client.async_job_check_max_time:
                async_job_check_time = self._client.async_job_check_max_time
            job_state = self._check_job(job_id)
            if job_state['finished']:
                return job_state['result'][0]

    def _job_status_submit(self, input_params, context=None):
        return self._client._submit_job(
             'KBParallel.job_status', [input_params],
             self._service_ver, context)

    def job_status(self, input_params, context=None):
        """
        :param input_params: instance of type "KBParallelstatusInputParams"
           (status() method) -> structure: parameter "joblist" of list of
           String
        :returns: instance of type "KBParallelstatusOutputObj" -> structure:
           parameter "num_jobs_checked" of Long, parameter "jobstatus" of
           list of String
        """
        job_id = self._job_status_submit(input_params, context)
        async_job_check_time = self._client.async_job_check_time
        while True:
            time.sleep(async_job_check_time)
            async_job_check_time = (async_job_check_time *
                self._client.async_job_check_time_scale_percent / 100.0)
            if async_job_check_time > self._client.async_job_check_max_time:
                async_job_check_time = self._client.async_job_check_max_time
            job_state = self._check_job(job_id)
            if job_state['finished']:
                return job_state['result'][0]

    def _cancel_run_submit(self, input_params, context=None):
        return self._client._submit_job(
             'KBParallel.cancel_run', [input_params],
             self._service_ver, context)

    def cancel_run(self, input_params, context=None):
        """
        :param input_params: instance of type "KBParallelcancel_runInput"
           (cancel_run() method) -> structure:
        :returns: instance of type "KBParallelcancel_runOutput" -> structure:
        """
        job_id = self._cancel_run_submit(input_params, context)
        async_job_check_time = self._client.async_job_check_time
        while True:
            time.sleep(async_job_check_time)
            async_job_check_time = (async_job_check_time *
                self._client.async_job_check_time_scale_percent / 100.0)
            if async_job_check_time > self._client.async_job_check_max_time:
                async_job_check_time = self._client.async_job_check_max_time
            job_state = self._check_job(job_id)
            if job_state['finished']:
                return job_state['result'][0]

    def _getlog_submit(self, input_params, context=None):
        return self._client._submit_job(
             'KBParallel.getlog', [input_params],
             self._service_ver, context)

    def getlog(self, input_params, context=None):
        """
        :param input_params: instance of type "KBParallelgetlogInput"
           (getlog() method) -> structure:
        :returns: instance of type "KBParallelgetlogOutput" -> structure:
        """
        job_id = self._getlog_submit(input_params, context)
        async_job_check_time = self._client.async_job_check_time
        while True:
            time.sleep(async_job_check_time)
            async_job_check_time = (async_job_check_time *
                self._client.async_job_check_time_scale_percent / 100.0)
            if async_job_check_time > self._client.async_job_check_max_time:
                async_job_check_time = self._client.async_job_check_max_time
            job_state = self._check_job(job_id)
            if job_state['finished']:
                return job_state['result'][0]

    def status(self, context=None):
        job_id = self._client._submit_job('KBParallel.status', 
            [], self._service_ver, context)
        async_job_check_time = self._client.async_job_check_time
        while True:
            time.sleep(async_job_check_time)
            async_job_check_time = (async_job_check_time *
                self._client.async_job_check_time_scale_percent / 100.0)
            if async_job_check_time > self._client.async_job_check_max_time:
                async_job_check_time = self._client.async_job_check_max_time
            job_state = self._check_job(job_id)
            if job_state['finished']:
                return job_state['result'][0]
