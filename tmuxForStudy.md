# Using Tmux to Study Linux Tools

The idea here is to facilitate the study of Linux tools using the command line interface (CLI) without the need for written notes or an open browser. Tmux excels at this, so let's get started.

(Please remember to use 'sudo' if you are not the root user.)

## Getting Started

__	First, let's ensure our system is up to date and that Tmux is installed:__

**sudo apt update -y**
**sudo apt install tmux -y**

__	After the installation is complete, start Tmux by simply typing:__

**tmux**

Now, you're in a Tmux terminal screen with a distinctive green status bar at the bottom.

__	Tmux provides a range of commands accessible through a specific key combination: Ctrl-b. For instance:__

    (directional arrow) -> Move to the terminal pane in that direction.
    % -> Split the window horizontally.
    " -> Split the window vertically.
    X -> Close a pane.
    $ -> Rename the session.
    c -> Create a new window.
    n -> Move to the next window.
    p -> Move to the previous window.
    (enter number) -> Move to a specific window by its number.

While Tmux offers many commands, for our purpose, we only need to create extra panes and learn how to close them.

__	Creating a Study Session (after opening Tmux - all single letter commands after pressing Ctrl-b):__

**"**
**$**
**ncat-Study**

This sequence creates a Tmux session, adds a second pane at the bottom, and renames the session.

__	Now, install ncat and clear the screen:__

**sudo apt install ncat -y**
**clear**

__	Navigate to the lower pane with the ncat manual page:__

**(down arrow)**
**man ncat**

You now have two panes—one above, ready for your work, and one below, displaying the ncat manual page.

![Here's the end result. We can now start working!](IMAGE.URL)

Practical Use Case: SSH and SCP Learning.

Imagine you're learning about SSH. You can create three panes:

- The upper two panes for connecting to different machines using SSH.
- The lower pane for displaying the SSH manual page (man ssh).

With this setup, you can practice SSH commands in the upper panes while referring to the manual page in the lower pane. You can also introduce SCP to transfer files between machines, change file permissions, and explore other SSH-related tasks—all within the same Tmux session.

__	Detaching and Reattaching:__

One of Tmux's most powerful features is the ability to detach and reattach sessions:

__	Starting (and naming) a new session:__

**tmux new-session -s <name_of_session>**

__	Detaching the session (again, Ctrl-b is used first):__


**d**

__	Reattaching the session:__

**tmux attach-session -t <name_of_session>**

__	So, you can "Ctrl-b" and "d" at any time, go for a stroll, and when you want to continue your study session. In our example:__

**tmux attach-session -t ncat-Study**

And there you have it! You're back in your ncat study session.

The possibilities with Tmux are endless.