BEGIN {
    start = 0;
    stop = 0;
    bytes = 0;
}

$1 == "r" {
    time = $2;
    size = $6;

    if (start == 0)
        start = time;

    stop = time;
    bytes += size;

    if (stop > start) {
        throughput = (bytes * 8) / ((stop - start) * 1000);
        printf("%f %f\n", time, throughput);
    }
}
