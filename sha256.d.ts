declare module 'react-native-sha256' {
    export const sha1: (input: string) => Promise<string>;
    export const sha1Bytes: (input: Array) => Promise<string>;
    export const sha256: (input: string) => Promise<string>;
    export const sha256Bytes: (input: Array) => Promise<string>;
}
