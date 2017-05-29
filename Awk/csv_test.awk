#! /usr/bin/env bash
BEGIN {
    FS = "\t";
}
{
    counts[$key] += $value;
}
END {
    for (k in counts) { print k, counts[k]; }
}
