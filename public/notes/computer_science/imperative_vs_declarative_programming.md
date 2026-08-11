# Difference Between Imperative and Declarative Programming

## Imperative Programming ("How")

In an imperative approach, you write explicit, sequential instructions telling the computer 
step-by-step how to change its state to reach a desired outcome. You manage control flow 
(loops, conditionals) and state changes directly.

## Declarative Programming ("What")

In a declarative approach, you describe the desired structure, outcome, or transformation, 
leaving the underlying execution details and control flow to the runtime engine or framework.

Calling a framework or language "declarative" is a statement about its design 
philosophy and main interfaces:

1. It abstracts away state orchestration in its core domain (e.g., rendering UI, querying databases).

2. It allows you to express your intent ("Draw a red button here") while the framework handles the 
imperative heavy lifting (allocating memory, layout passes, pixel drawing).

3. You will still write imperative logic when you need fine-grained control over execution steps, 
data transformations, or side effects.

