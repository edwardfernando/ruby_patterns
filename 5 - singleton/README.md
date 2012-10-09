# Singleton Pattern

## Motivation

Create a one-of-a-kind object for which there is only one instance.

## Problem

Book example has a ChocolateBoiler class that controls a chocolate boiler.
The job of the boiler is to take in chocolate and milk, boil them, then
pass the them on to the next processing step.

As long as only one instance of the ChocolateBoiler class is controlling
the boiler, everything is ok.  But if there are more than 1 instance
trying to control the boiler, you're gonna have a bad time.  One instance might
call fill while another instance is bringing the already full boiler to a
boil.

## Solution

Use the singleton pattern to ensure that there is always only one instance of
the ChocolateBoiler.

Ruby has a Singleton module.  Include it in the class and presto!

It makes the new method private and provides the instance method for returning
the same object each time it is called.
