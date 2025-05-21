# mc7h/bloaty-docker

A portable, containerization of Google's [Bloaty](https://github.com/google/bloaty) a size profiler for binaries. Intended to be used from CI pipelines.

Supports amd64 and arm64 architectures.

# Usage

The image is available on Docker Hub as `mc7h/bloaty`. You can pull and run it with the following command:

```
docker run mc7h/bloaty
```

Being a container you will need to volume map the file(s) you wish to scan. For example:

```
$ docker run --volume ~/Downloads:/home mc7h/bloaty /home/terraform

    FILE SIZE        VM SIZE    
 --------------  -------------- 
  49.9%  41.8Mi  49.8%  41.8Mi    .text
  28.7%  24.0Mi  28.6%  24.0Mi    .gopclntab
  19.1%  16.0Mi  19.1%  16.0Mi    .rodata
   1.5%  1.29Mi   1.5%  1.29Mi    .noptrdata
   0.5%   411Ki   0.5%   411Ki    .data
   0.1%   126Ki   0.1%   126Ki    .typelink
   0.0%       0   0.1%   101Ki    .bss
   0.0%       0   0.1%  84.0Ki    .noptrbss
   0.0%  27.4Ki   0.0%  27.4Ki    .itablink
   0.0%  22.1Ki   0.0%  22.1Ki    .go.buildinfo
   0.0%  5.62Ki   0.0%       0    [Unmapped]
   0.0%  3.00Ki   0.0%  3.00Ki    [LOAD #2 [RX]]
   0.0%     640   0.0%     640    [ELF Section Headers]
   0.0%     192   0.0%     192    [ELF Program Headers]
   0.0%     184   0.0%       0    .shstrtab
   0.0%     100   0.0%     100    .note.go.buildid
   0.0%      96   0.0%      96    .go.fipsinfo
   0.0%      57   0.0%      57    [LOAD #4 [RW]]
   0.0%      52   0.0%      52    [ELF Header]
   0.0%      36   0.0%      36    .note.gnu.build-id
   0.0%      20   0.0%      20    [1 Others]
 100.0%  83.7Mi 100.0%  83.8Mi    TOTAL
```

# Local Building / Development

To see all make recipes, run: `make`. Anything with a `-local` suffix is intended to be used as part of a local dev loop.

