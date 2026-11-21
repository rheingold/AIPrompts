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

These prompts are the result of nearly two years of hands-on experience with AI-operated web development and the resulting code. They encode lessons learned from common pitfalls, misconfigurations, and architectural mistakes that arise when AI agents are given insufficient or ambiguous guidance.

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

1. Clone this repository.
2. Select the appropriate prompt file for your use case.
3. Set the file content as the AI system prompt (or role/skill instruction) in your target AI client.
4. Refer to [`user_manual_for_AI.md`](user_manual_for_AI.md) for setup and configuration guidance.

## License

Private repository — all rights reserved.
