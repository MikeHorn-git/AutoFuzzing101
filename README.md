# Description

Automation & Materials for [Fuzzing101](https://github.com/antonio-morales/Fuzzing101) course.

# Requirements

* afl++
* base-devel
* gdb
* wget

# Usage

```bash
Usage: make <target>
Targets:
  core_dump       Set core dump pattern for debugging.
  cpu_governor    Set CPU governor to performance mode.
  fix             Run both core_dump and cpu_governor.
  xpdf_install    Install xpdf in the fuzzing_xpdf directory.
  xpdf_examples   Download sample PDF files for fuzzing.
  xpdf_fuzzing    Start fuzzing xpdf with AFL++.
  xpdf_all        Run the full install, examples, and fuzzing process.
  xpdf_clean      Clean up the xpdf build and examples.
  help            Display this help message.
  ```
