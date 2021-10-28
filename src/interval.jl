struct Interval
    start_iv
    end_iv
    interval
    Interval() = new(nothing, nothing)
    Interval(start_iv::Real, end_iv::Real) = new(start_iv, end_iv)

end
    
Base.minimum(iv::Interval) = iv.start_iv
Base.maximum(iv::Interval) = iv.end_iv
Base.in(x::Real, iv::Interval) = iv.start_iv isa Number && iv.end_iv isa Number ? (x ∈ iv.start_iv:iv.end_iv) : false
Base.isempty(iv::Interval) = iv.start_iv isa Number && iv.end_iv isa Number ? false : true
