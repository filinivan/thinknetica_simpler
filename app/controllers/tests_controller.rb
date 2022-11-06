class TestsController < Simpler::Controller

  def index
    @time = Time.now

    render plain: 'Some plain text', status: 201 

  end

  def create

  end

  def show

  end

end
