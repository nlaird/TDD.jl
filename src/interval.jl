struct Interval
    start_iv::Int
    end_iv::Int
end

Base.minimum(iv::Interval) = iv.start_iv
Base.maximum(iv::Interval) = iv.end_iv