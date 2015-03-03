package de.grammarcraft.xtend.annotatedflow

import de.grammarcraft.xtend.flow.annotations.FunctionUnit
import de.grammarcraft.xtend.flow.annotations.InputPort
import de.grammarcraft.xtend.flow.annotations.OutputPort

@FunctionUnit(
    inputPorts = #[
        @InputPort(name="input", type=String)
    ],
    outputPorts = #[
        @OutputPort(name="output", type=String)
    ]
)
class Reverse {
    
    // This method implements the semantic of the function unit      
    override process$input(String msg) {
        output <= [
            val reversedMsgBuilder = new StringBuilder
            var index = msg.length
            while (index > 0) {
                index = index - 1
                reversedMsgBuilder.append(msg.charAt(index))
            }
            reversedMsgBuilder.toString    
        ]
    }
    
}