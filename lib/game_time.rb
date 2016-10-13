class GameTime

  attr_reader :start_time, :end_time, :minutes, :seconds
  def initialize
    @start_time = start_time
    @end_time = end_time
    @minutes = minutes
    @seconds = seconds
  end

  def start
    @start_time = Time.now
  end

  def end
    @end_time = Time.now
    time_elapsed
  end

  def time_elapsed
    time = (((end_time - start_time) / 60).divmod 1)
    @minutes = time[0]
    @seconds = (time[1] * 60).round
  end
  def minutes_elapsed
    minutes
  end

  def seconds_elapsed
    seconds
  end

end
