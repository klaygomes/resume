#/bin/sh
make -s clean
echo "Watching for changes... (Press Ctrl+C to stop)"
while true; do make -s build; sleep 1; done
