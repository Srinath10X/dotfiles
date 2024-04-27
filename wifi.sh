#!/bin/bash

systemctl stop iwd && systemctl start iwd
iwctl
