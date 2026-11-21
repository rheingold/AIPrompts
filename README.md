# AIPrompts — AI System Prompts Repository

## Overview

This repository contains AI system prompts curated by **[Rheingold](https://github.com/rheingold)** for AI-assisted IT development workflows. The prompts are organized into two categories:

### Generic Agents

- [`system_prompt_MAIN.md`](system_prompt_MAIN.md) — Core system prompt defining fundamental AI behavior rules.
- [`system_prompt_MAIN_plus_templates.md`](system_prompt_MAIN_plus_templates.md) — Extended variant with additional templates.

### Role/Mode-Based Clients for IT Development

- [`multiagent_architect_role.md`](multiagent_architect_role.md) — Architect role specification.
- [`multiagent_coder_role.md`](multiagent_coder_role.md) — Coder role specification.
- [`multiagent_QAvalidator_role.md`](multiagent_QAvalidator_role.md) — QA Validator role specification.
- [`multiagent_tester_role.md`](multiagent_tester_role.md) — Tester role specification.

## Origin & Purpose

These prompts are the result of nearly two years of hands-on experience with AI-operated (partially web, mostly Win32 apps) development and the resulting code. They encode lessons learned from common pitfalls, misconfigurations, and architectural mistakes that arise when AI agents are given insufficient or ambiguous guidance.

The goal is to provide structured, evidence-based prompts that enforce discipline in:

- **Context & session management** — preventing data loss during context compression.
- **Security & input validation** — enforcing defense-in-depth principles.
- **Architecture & refactoring** — promoting separation of concerns, DRY, and SOLID.
- **Testing & verification** — requiring cross-checks and error-path coverage.
- **Repository hygiene** — maintaining clean, discoverable project structures.

## Structure

```
.
├── system_prompt_MAIN.md                      # Generic core system prompt
├── system_prompt_MAIN_plus_templates.md       # Extended generic prompt + templates
├── multiagent_architect_role.md               # Architect role/mode spec
├── multiagent_coder_role.md                   # Coder role/mode spec
├── multiagent_QAvalidator_role.md             # QA Validator role/mode spec
├── multiagent_tester_role.md                  # Tester role/mode spec
├── user_manual_for_AI.md                      # User guide (English)
├── uzivatel_navod_na_AI.md                    # User guide (Czech)
├── archive_backups/                           # Excluded from git (historical backups)
├── archive_olds/                              # Excluded from git (obsolete prompts)
└── README.md
```

## Usage

1. Copy the files, mostly the XXXX#.#... numbered items. Sometemise in role-based systems there are two descriptors (identity and rules, so split it). Do not copy "MY ORIGINAL" text, those are only backups. You need not necessarily to copy the "tempaltes" part of the tempaltes .md.
2. Paste it into the client(s) system/assistent/agent/mode/role prompt.
3. Cross your fingers and hope for the best.

## License

This project is licensed under the [MIT License](LICENSE).

### MIT License

Copyright (c) 2026 Rheingold

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
