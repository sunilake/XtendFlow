package de.grammarcraft.xtend.firstflow

import java.util.List
import java.util.ArrayList

class Collector extends FunctionUnit {
  
    new(String separator) {
        super('Collector')
        this.separator = separator
    }
    
    // input1 pin
    public val (String)=>void input1 = [msg | input1(msg)]
    def input1(String msg) { accumulateInput(msg) }

    // input2 pin
    public val (String)=>void input2 = [msg | input2(msg)]
    def input2(String msg) { accumulateInput(msg) }
    
    // output pin    
    public val output = new OutputPin<String>('''«this».output''', 
        [forwardIntegrationError]
    )
    
    // convenient operator for function units defining one and only one output pin:
    // defines operator "->", used as function unit connector
    def void operator_mappedTo((String)=>void operation) {
        output -> operation
    }
    
    
    val String separator
    val List<String> accumulation = new ArrayList

    // This method implements the semantic of the function unit      
    private def accumulateInput(String msg) {
        accumulation.add(msg)
        if (accumulation.length == 2) output.forward(accumulation.join(separator))
    }
        
}