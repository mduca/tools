#!/bin/bash
# Show tmux PID
ps aux | grep [t]mux$ | awk '{print $2}'
