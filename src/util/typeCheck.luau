return function(value: any, typeName: string, callBackA: ( any ) -> (), callBackB: ( any ) -> ()): boolean
    -- Correct?
    if typeof(value) == typeName then
        callBackA(value)
        return true
    else
        -- Guess not..
        callBackB(value)
        return false
    end
end