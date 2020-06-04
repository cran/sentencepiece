#include <Rcpp.h>
// Copyright 2016 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.!

#include "testharness.h"

#ifndef OS_WIN
#include <unistd.h>
#endif

#include <memory>
#include <string>
#include <vector>

#include "common.h"
#include "util.h"

namespace sentencepiece {
namespace test {

namespace {
struct Test {
  const char *base;
  const char *name;
  void (*func)();
};
std::vector<Test> *tests;
}  // namespace

bool RegisterTest(const char *base, const char *name, void (*func)()) {
  if (tests == nullptr) {
    tests = new std::vector<Test>;
  }
  Test t;
  t.base = base;
  t.name = name;
  t.func = func;
  tests->emplace_back(t);
  return true;
}

int RunAllTests() {
  int num = 0;
  if (tests == nullptr) {
    Rcpp::Rcout << "No tests are found" << std::endl;
    return 0;
  }

  for (const Test &t : *(tests)) {
    Rcpp::Rcout << "[ RUN      ] " << t.base << "." << t.name << std::endl;
    (*t.func)();
    Rcpp::Rcout << "[       OK ] " << t.base << "." << t.name << std::endl;
    ++num;
  }
  Rcpp::Rcout << "==== PASSED " << num << " tests" << std::endl;

  return 0;
}

ScopedTempFile::ScopedTempFile(absl::string_view filename) {
  char pid[64];
  snprintf(pid, sizeof(pid), "%u",
#ifdef OS_WIN
           static_cast<uint32>(::GetCurrentProcessId())
#else
           ::getpid()
#endif
  );
  filename_ = string_util::StrCat(".XXX.tmp.", filename, ".", pid);
}

ScopedTempFile::~ScopedTempFile() {
#ifdef OS_WIN
  ::DeleteFile(WPATH(filename_.c_str()));
#else
  ::unlink(filename_.c_str());
#endif
}
}  // namespace test
}  // namespace sentencepiece