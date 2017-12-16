if (capabilities("aqua")) {
    options(device="quartz")
    
    setHook(packageEvent("grDevices", "onLoad"),
            function(...) grDevices::quartz.options(
                                         width = 5,
                                         height = 4
                                     ))
}
