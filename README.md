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
  ptrace_scope    Set ptrace_scope to 0.
  fix             Run both core_dump, cpu_governor and ptrace_scope.
  xpdf_all        Run the full install, examples, and fuzzing process.
  xpdf_disctlean  Remove all build and installation files.
  help            Display this help message.
```
# Credits

* [Antonio-Morales](https://github.com/antonio-morales)
* [trustfoundry.net](https://trustfoundry.net/2020/01/22/introduction-to-triaging-fuzzer-generated-crashes/)
