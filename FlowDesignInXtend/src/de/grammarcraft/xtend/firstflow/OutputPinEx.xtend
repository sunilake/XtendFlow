package de.grammarcraft.xtend.firstflow

import java.util.ArrayList
import java.util.List

class OutputPinEx<MessageType> {

    (Exception)=>void errorOperation
    
    new((Exception)=>void errorOperation) {
        this.errorOperation = errorOperation
    }

    private val List<(MessageType)=>void> outputOperations = new ArrayList
    
    
    def forward(MessageType msg) {
        if (!outputOperations.empty) {
            outputOperations.forEach[
                operation | operation.apply(msg)
            ]
        }
        else {
            errorOperation.apply(
                new RuntimeException("no binding defined for output of " + this + ": '" + 
                msg + "' could not be delivered"))
        }
    }
    
    // defines operator "->", used as function unit connector
    def void operator_mappedTo((MessageType)=>void operation) {
        outputOperations.add(operation)
    }
    
}