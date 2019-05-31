class SongsController < ApplicationController
  before_action :set_course

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @enrollment = @course.enrollments.new(enrollment_params)

    if @enrollment.save 
      redirect_to course_enrollments_path(@course)
    else
      render :new
    end
  end

  def destroy
    @enrollment = @course.enrollments.find(params[:id])
    @enrollment.destroy
    redirect_to course_enrollments_path(@course)
  end

  private
    def song_params
      params.require(:song).permit(:title)
    end

    def set_artist
      @artist = Artist.find(params[:artist_id])
    end
end

