# Python WASI build

This is a [WASI](https://wasi.dev/) build of the Python 3.12 interpreter compiled by [VMware Labs](https://github.com/vmware-labs/webassembly-language-runtimes).

It is published as an NPM package [@antonz/python-wasi](https://www.npmjs.com/package/@antonz/python-wasi):

```
https://unpkg.com/@antonz/python-wasi/dist/python.wasm
```

## Usage

Using the [Runno](https://github.com/nalgeon/runno) runtime:

```js
import { WASI } from "https://unpkg.com/@antonz/runno/dist/runno.mjs";

const url = "https://unpkg.com/@antonz/python-wasi/dist/python.wasm";
const result = await WASI.start(fetch(url), {
    args: ["python", "--version"],
    stdout: (out) => console.log(out),
    stderr: (err) => console.error(err),
});
console.log(`exit code = ${result.exitCode}`);
```

Result:

```
Python 3.12.0
exit code = 0
```

## Building from source

```
make prepare
make build
```

## License

Copyright 2023 [VMware Labs](https://github.com/vmware-labs/webassembly-language-runtimes), Apache-2.0 license.

Python is copyrighted by [Python Software Foundation](https://docs.python.org/3/license.html), PSF License Agreement.
