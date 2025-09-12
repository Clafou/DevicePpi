// Generates a Swift-formatted machineName:ppi dictionary
// Usage: deno -R GenerateSwift.js > ../Sources/DevicePpi/Devices.swift

import { parse } from "jsr:@std/yaml";
const text = await Deno.readTextFile("./DevicePpi.yaml");
const data = parse(text);
const lines = [];
for (const group of Object.values(data)) {
    for (const [ppi, devices] of Object.entries(group)) {
        for (const device of Object.values(devices)) {
            for (const [name, ids] of Object.entries(device)) {
                lines.push(`        \\\\ ${name} `);
                for (const id of Object.values(ids)) {
                    lines.push(`        "${id}": ${ppi},`);
                }
            }
        }
    }
}
const string = `// Generated from DevicePpi.yaml
let machineNameToPpi : [String : Double] =
    [
${ lines.join("\n") }
    ]`;
console.log(string);