# Elixir Concurrency Bug: Enum.each and Long-Running Operations

This repository demonstrates a potential concurrency issue in Elixir when using `Enum.each` with a long-running operation inside the function.  The issue arises when the function within `Enum.each` blocks for a significant period, potentially affecting the overall performance and potentially introducing unexpected behavior in concurrent scenarios. The solution provides a more robust approach using `Task.async_stream` for better handling of long running tasks.

## Bug Description

The bug involves using `Enum.each` to process a list.  If one of the list items triggers a long-running operation (simulated using `Process.sleep` in this example), it can block the entire `Enum.each` process, impacting the order of output and the responsiveness of the application.

## How to Reproduce

Clone this repository, and run `bug.ex`. Observe the output and its potential for unexpected order.  Then, compare this to the output of `bugSolution.ex`.

## Solution

The solution involves replacing `Enum.each` with `Task.async_stream` in order to process elements concurrently without blocking the main process. This approach ensures better responsiveness and more predictable behavior.
