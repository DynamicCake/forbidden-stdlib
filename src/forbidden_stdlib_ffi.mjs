import { Ok, Error as GError } from "./gleam.mjs";
import { Errored, Thrown } from "./forbidden/exception.mjs";

export function is_truthy(x) {
    return !!x
}

export function coerce(x) {
    return x
}
export function yeet(x) {
    throw x
}
export function procrastinate() {
    while (true) {
        const hmm = 41 + 1
        hmm
    }
}

export function nan() {
    return NaN
}
export function is_nan(n) {
    return isNaN(n)
}

// stolen from https://github.com/lpil/exception/blob/37d8ef257e9bb0b9e8c6963747a498ca5b6e2099/src/exception_ffi.mjs

export function on_crash(cleanup, body) {
    try {
        return body();
    } catch (e) {
        cleanup();
        throw e;
    }
}

export function rescue(f) {
    try {
        return new Ok(f());
    } catch (e) {
        if (e instanceof Error) {
            return new GError(new Errored(e));
        } else {
            return new GError(new Thrown(e));
        }
    }
}

export function defer(cleanup, body) {
    try {
        return body();
    } finally {
        cleanup();
    }
}

export function labor(length) {
    const start = Date.now()
    while (start + length > Date.now()) {
        () => { }
    }
}

export function evaluate(code) {
    return eval(code)
}
