#!/bin/bash


service zend-server start


exec supervisord -n > /dev/null 2>/dev/null
