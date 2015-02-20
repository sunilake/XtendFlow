package de.grammarcraft.xtend.annotatedflow

import de.grammarcraft.xtend.flow.annotations.FunctionUnit
import java.util.List
import de.grammarcraft.xtend.flow.annotations.InputPort
import de.grammarcraft.xtend.flow.annotations.OutputPort

@FunctionUnit(
        inputPorts = #[
            @InputPort(name="input", type=List, typeArguments=#[String])
        ],
        outputPorts = #[
            @OutputPort(name="output", type=List, typeArguments=#[String])
        ]
    )
class ComplextypedFU {
    
    override processInput(List<String> msg) {
        output <= msg
    }

    /**
     * {@inheritDoc} 
     * Note: Will later be automatically generated by the FunctionUnit annotation for function units with only one input port. 
     * Here added only for exploring Xtend's embedded DSL design capabilities
     */
    override void <= (List<String> msg) {
        input <= msg
    }
    
    /**
     * {@inheritDoc} 
     * Note: Will later be automatically generated by the FunctionUnit annotation for function units with only one input port. 
     * Here added only for exploring Xtend's embedded DSL design capabilities
     */
    override void <= (()=>List<String> msgClosure) {
        input <= msgClosure.apply
    }
    
}
