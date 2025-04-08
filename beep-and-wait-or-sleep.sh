function beep {
    # WITH ARGUMENT FLAGS:
    # beep -f 880 -d 2000
    param (
        [int]$f = 880,  # A5 is 880 Hz
        [int]$d = 2000  # 2 seconds
    )

    # WITH POSITIONAL ARGUMENTS:
    # beep 880 2000
    if ($args.Count -gt 0) {
        $f = $args[0]
    }
    if ($args.Count -gt 1) {
        $d = $args[1]
    }

    [console]::beep($f, $d);
}

function wait {
    Start-Sleep -Milliseconds $args[0]
}

function mario {
    beep 659 500; beep 659 1000; beep 659 1000; wait 500; beep 523 1000; beep 659 1000; beep 784 2000; beep 391 2000;
}
