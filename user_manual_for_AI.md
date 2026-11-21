# Hints and Tips for Working Effectively with AI

## 1. Adapt your instructions to your level of expertise

**If you are an experienced developer or programmer:**

- Communicate as you would with another professional developer. Use precise technical terminology and avoid ambiguity.
- Tell the AI **what must be achieved and how it should be approached**, while leaving implementation details open where appropriate.
- Specify architectural constraints, interfaces, expected behaviour, and technical requirements. Let the AI ask questions when necessary.

**If you are a user or less experienced programmer:**

- Describe what you want to achieve, what the result should look like, and what constraints must be respected. Let the AI propose how to achieve it.
- Ask the AI to help you develop a detailed Terms of Reference (ToR) document in `.txt` or `.md` format. Build it through dialogue until it accurately describes your expectations.
- Ask the AI to explain its understanding of your requirements back to you. Review the explanation, correct misunderstandings, and ask about anything you do not understand.

Do not hesitate to discard an unsatisfactory solution and start again when building from scratch. If only one aspect is wrong, ask the AI to redesign that part completely while stating explicitly you require the preserving the remaining functionality—for example, redesigning the UI or UX without changing the underlying logic.

Do not insist on preserving every detail of an earlier version if the new solution is substantially better overall.

See sysprompt §0 and §2.

## 2. Maintain persistent project context

Long conversations lose detail. When their history is compressed, the AI may retain the general direction of the work but forget existing structures, conventions, dependencies, and implementation decisions.

Create and maintain a few project files:

- **`AI.md` or `AI.txt`** — project purpose, requirements, current state, important decisions, conventions, and instructions for the AI.
- **`TODO.md`** — outstanding tasks, priorities, and progress.
- **`CONVENTIONS.md` or a section in `START_HERE.md`** — established terminology, command names, reusable components, and architectural conventions.
- **`AI_PRIVATE.txt` or a private directory** — environment-specific details such as local paths and server addresses. Keep secrets separate and properly protected.

Ask the AI to maintain these files as the project evolves and to consult them whenever work starts, resumes, or continues in a new conversation. If necessary, explicitly attach the files or instruct the AI to load them before proceeding.

Keep sensitive information, especially passwords, API keys, and authentication tokens, out of ordinary context files and Git commits. When working with SSH servers or APIs, prefer properly managed key-based or token-based authentication over passing passwords to the AI.

See sysprompt §0 and §3.


## 3. Treat development as a structured process

Do not rely on an informal conversation alone. Ask the AI to follow a process appropriate to the task:

**Assess → Design → Plan → Test design → Implement → Verify → Deploy**

Even small modifications to an existing solution benefit from this approach, although the individual phases can be simplified.

- **Assess:** Ask the AI to examine the existing implementation, requirements, dependencies, and possible solutions.
- **Design:** Ask it to document functional and non-functional requirements, architecture, security, interfaces, and other relevant constraints.
- **Plan:** Ask it to generate a `TODO.md` from the requirements and cross-check every task against them.
- **Test design:** Ask it to define relevant tests and expected results before or alongside implementation.
- **Implement:** Have it work on one coherent task at a time, updating progress and context as it goes.
- **Verify:** Require it to execute the available checks and report the actual results.
- **Deploy:** When required, have it deploy the correct version and verify that the intended instance is running.

You should review the requirements and plan yourself. The AI can help formulate them, but you remain responsible for deciding whether they accurately represent what you want.

Keep the project documented even when you work with the AI on only one part of it. A clear record makes it easier to restart, change direction, or replace a complicated solution without losing the original requirements.

See sysprompt §0, §1.5 and §1.8.

## 4. Review the overall logic before polishing details

Ask the AI to explain how its solution works and how the modified components relate to the rest of the project.

Review whether the solution addresses the actual problem, respects the architecture, preserves existing behaviour, and accounts for relevant failure scenarios.

Start by examining the overall logic and structure. Leave minor formatting, naming, grammar, and stylistic refinements until the important issues are resolved.

Do not confuse a convincing explanation with proof of correctness. Ask the AI to demonstrate that the implementation works through compilation, execution, and appropriate tests.

For small components, a quick architectural review is often more valuable than repeatedly perfecting individual functions. Pay particular attention to whether the AI understands the wider context: this is where many mistakes originate.

## 5. Preserve existing structures and conventions

A common failure is that the AI creates something new instead of extending what already exists. This often happens when it loses detailed context during a long conversation.

Maintain an inventory of established commands, functions, methods, components, and other reusable elements. Ask the AI to consult it before introducing new structures.

Phrase requests as constraints, for example:

- "Extend the existing X to also support Y."
- "Search for an existing implementation before proposing a new one."
- "Preserve the current input format and modify the parser, not the input."
- "Identify where this method is called and which components depend on its behaviour."

Ask the AI to inspect the relevant files and explain their relationships before making significant changes.

Do not assume that "add", "append", or "create" means "build everything from scratch". Existing, related components should be analysed and reused or extended where appropriate. New code should be justified by the requirements and architecture, not by a loss of context.

See sysprompt §1.6–1.7.

## 6. Avoid common implementation and deployment mistakes

Ask the AI to verify the following throughout development:

- **Correct targets:** Confirm the source files, build output, deployment directory, runtime location, URL, or UNC path. Compiling the correct code is useless if the wrong executable is launched.
- **Consistent destinations:** Do not change target locations between iterations without justification or leave competing old versions behind.
- **Minimal changes:** Prefer modifying existing code over regenerating entire scripts or utilities unnecessarily.
- **Controlled cleanup:** Remove temporary test and editing scripts when they are no longer needed. Retain and organise useful recurring automation, such as build, test, and deployment scripts.
- **No unnecessary hardcoding:** Use configuration or parameters for values that vary by environment, including paths, filenames, locales, decimal separators, and UI labels.
- **Scope control:** Change only the requested functionality and directly related components. Preserve unrelated code, data, and text exactly where required.
- **Process management:** Stop obsolete or hung processes when necessary, replace the correct running version, and verify the restart.

Avoid large, all-purpose scripts when precise edits are safer. Ask the AI to use suitable file-editing tools or MCP operations where available. When using command-line operations, require careful handling of quotation marks, apostrophes, backslashes, `@` signs, and nested strings.

You should review proposed deletions and significant changes yourself, especially where they could destroy useful automation or affect unrelated functionality.

## 7. Require actual verification

**The most dangerous situation is when everything appears to work but has not actually been verified.**

Ask the AI to perform the relevant checks after each code change, unless you explicitly limit the scope or the environment makes a check impossible:

1. Check syntax and structural integrity.
2. Compile or build the affected components.
3. Run the application or relevant debugging procedure.
4. Execute functional tests.
5. Run regression tests to ensure existing functionality still works.
6. Verify deployment and the running version, where applicable.
7. Update and verify the distribution package, installers, and installation scripts, where applicable.

For complex projects, ask the AI to provide unit, integration, and UI/UX tests as appropriate. For a simple script without a test suite, a targeted manual test may be sufficient.

Ask it to update tests that no longer cover the modified behaviour. Require it to read command output, inspect errors and warnings, and report what was actually tested, what passed, what failed, and what remains unverified.

Do not accept "implemented successfully" as evidence. An exit code of zero does not necessarily prove that the intended operation succeeded. The application may have failed silently, generated incomplete output, or operated on the wrong target.

You should review the evidence and decide whether the verification is sufficient for the importance of the task.

## 8. Require explicit error handling

Ask the AI to assess possible failure modes for commands, operations, APIs, and MCP tools. Require it to handle expected errors explicitly rather than allowing them to disappear silently.

The implementation should distinguish between a non-critical operation that failed and a failure that prevents the overall task from succeeding. Return useful diagnostic information through appropriate error messages, warnings, return values, or logs.

For MCP tools and APIs, ask the AI to use a consistent error-reporting convention. A failed action must not produce a response that appears successful. For remotely operated services, sensitive diagnostic details should remain in protected logs, with a correlation ID provided when appropriate.

Ask the AI to test failure paths as well as successful execution, including situations in which an operation fails without returning an obvious error code.

## 9. Use MCP tools and workspace operations deliberately

AI agents sometimes invent unnecessarily complicated workflows or misuse available tools.

Ask the AI to choose the most direct, precise, and suitable available operation:

- Prefer targeted file-editing tools over elaborate command-line workarounds when appropriate.
- Establish a clear process for copying source files into a workspace, editing them, and returning the results to the correct destination.
- If a targeted search fails, broaden it rather than continuing to guess. Use commands such as `ls`, `dir`, or sensible wildcard searches when appropriate.
- Let the AI analyse and filter broad search results rather than filling the context with unnecessary output.
- Require it to check the actual capabilities and documented interfaces of MCP tools instead of improvising unsupported operations.

The objective is not to minimise the number of commands at any cost. It is to achieve precise, observable, and reliable results with as little unnecessary complexity as possible.

## 10. Break out of repetitive mistakes

When the AI repeatedly produces the same incorrect result, rephrasing the same request is unlikely to help.

Stop the current approach and ask it to explain its assumptions, identify the source of the error, and reassess the available evidence.

Ask it to devise a minimal reproducible test, test a hypothesis that could disprove its current conclusion, or investigate a specific failure scenario. Security tests and hypothetical scenarios can also help when they lead to concrete verification.

If the approach is fundamentally flawed, ask for alternative solutions or a fresh implementation based on the original requirements.

Give direct feedback, but explain what is wrong and why. For example:

- "Stop. This changes the wrong component. The parser must be corrected while the existing input contract remains unchanged."
- "You are repeating the same approach despite the test results. Reassess your assumptions and propose a different explanation."
- "The build succeeded, but the running application still uses the old executable. Verify the deployment and runtime paths."

Avoid endless cycles of unverified fixes. If necessary, ask the AI to summarise the evidence and reconsider the problem from the beginning.

## 11. Use a devil's advocate and an independent evaluator

For difficult decisions, ask the AI to take two distinct roles.

First, let it act as a **devil's advocate**, challenging your proposal with the strongest reasonable counterarguments, risks, weaknesses, and alternatives.

Then ask it to act as an **independent evaluator or mediator**, assessing both sides, distinguishing verifiable facts from assumptions and subjective preferences, and recommending the best solution or compromise.

Human factors such as usability, feelings, and interpersonal consequences may be relevant arguments, but they should be distinguished from objective facts.

Use this exercise to uncover weaknesses before committing to a decision. You remain responsible for the final choice.

See §2.

## 12. Create reusable instructions for recurring tasks

If you regularly ask the AI to perform similar tasks, create dedicated instruction files for them.

For example, a documentation instruction file can specify the expected format, scope, conventions, and output location.

Ask the AI to improve these instructions whenever recurring errors or omissions are discovered. Use keywords or short task descriptions to identify the appropriate instructions.

Keep reusable task instructions separate from the project's current state: one explains how to perform a task; the other explains what currently exists and what constraints apply.

## 13. Provide precise feedback and remain in control

Be direct when the AI misunderstands requirements, ignores constraints, or repeats mistakes. Explain the problem and specify the required correction.

For example:

- "Do not create another command. Search the existing command taxonomy and extend the established implementation."
- "You modified unrelated files. Revert those changes and restrict the implementation to the requested scope."
- "The command returned success, but the expected result is missing. Investigate the actual output before continuing."

Ask the AI to confirm the relevant constraints before proceeding if it repeatedly violates them.

Express dissatisfaction when appropriate, but support it with evidence and clear reasoning. Specific feedback is far more useful than anger alone.

## 14. A practical checklist for each iteration

Ask the AI to confirm the following before considering a task complete:

- The current requirements and project context were consulted.
- Existing implementations and dependencies were examined.
- The requested changes were made without unnecessary regeneration.
- Unrelated functionality and content were preserved.
- Syntax, build, execution, and relevant tests were checked.
- Errors, warnings, and command output were inspected.
- The correct deployment target and running version were verified, where applicable.
- Temporary files and processes were cleaned up; useful automation was retained.
- Context files, TODOs, and progress records were updated.
- Remaining limitations and unverified assumptions were documented.

Review this confirmation yourself. Adapt the checks to the task and require an explanation whenever an important check was omitted.

---

## The underlying principle

Treat AI as a capable but imperfect collaborator. Ask it to analyse, design, implement, explain, and test; give it enough context to preserve what already works; and require evidence for claims of success.

Your responsibility is to define the intended result, review the requirements and important decisions, challenge incorrect assumptions, and decide whether the final evidence is sufficient.

The objective is not to supervise every line of code. It is to establish a repeatable process in which the AI understands what must be achieved, makes controlled changes, preserves existing functionality, and demonstrates that the result meets your requirements.