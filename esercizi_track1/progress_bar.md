
This Bash script implements a text-based progress bar using a background process and inter-process signaling.
It visually represents the progress of a long-running task by printing dots ('.') at regular intervals until the main job finishes .

The script simulates a progress indicator that runs in parallel with a "long-running process."
It uses a background process to print dots periodically, signals to control that process, and the trap command to cleanly handle termination. 

Trap defines actions to take when specific signals are received. 
SIGUR1 (user-defined signal) teels the background process to stop. 
The main process also traps EXIT to ensure the background job is cleaned up properly when the script ends or is interrupted. 
The main and background processes communicate using kill -USR1 $pid that sends a stop signal; trap "exit" SIGUSR1 handles that signal inside the background process. This technique avoids leaving orphaned background jobs.
wait command pauses the main script until the background process finishes. 


