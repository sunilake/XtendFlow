package de.grammarcraft.xtend.annotatedflow

import de.grammarcraft.xtend.flow.annotations.Operation
import de.grammarcraft.xtend.flow.annotations.Port
import de.grammarcraft.xtend.flow.annotations.Unit

@Operation @Unit(
    inputPorts = #[
        @Port(name="input", type=String)
    ],
    outputPorts = #[
        @Port(name="output", type=String)
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