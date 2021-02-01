#!/bin/bash

/etc/init.d/nginx start
/etc/init.d/mysql start
/etc/init.d/php7.3-fpm start

bash /root/ascii_art_42.sh

bash
