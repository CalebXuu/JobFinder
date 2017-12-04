class PostsController < ApplicationController



  before_action :require_user
	before_action :find_post, only: [:show, :edit, :update, :destroy]

  layout 'post'


  # GET /posts
  # GET /posts.json
  def index
    @search = Post.ransack(params[:q])
    @posts = @search.result
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new


    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create

    # @post = current_user.post.build(post_params)
    @post = current_user.posts.build(post_params)

		if @post.save
			redirect_to '/post', notice: "Post Added!"
		else
      @errors = @post.errors.full_messages
			render 'new'
		end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
			redirect_to post_path
		else
			render 'edit'
		end

  end


#take user input (search keyword)
def postSearch
  job_title = params[:job_title]
  company = params[:company]
  company = "*"   if params[:company].blank?
  location = params[:location]
  location = "*"   if params[:course_number].blank?
  return  job_title , company, location
end

# # concatenate course name and number to the API url
# def construct_search_URL
#   year, term, name, number = courseSearch
#   url = "http://www.sfu.ca/bin/wcm/course-outlines?" + year + "/" + term + "/" + name + "/" + number
#   return url
# end

# # with concatenated url, retrieve results
# # return array of Hashes
# def getCourseSearchResult
#   returnArray = []
#   obj = parse(getSummary(construct_search_URL))
#   for i in obj
#     returnHash = Hash.new
#     returnArray.push(returnHash)
#     returnHash["Title"] = i["title"]
#     returnHash["Section"] = i["text"]
#   end
#   return returnArray
# end


  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
  #  post = current_user.post.find(params[:id])
    @post.destroy
    # respond_to do |format|
    #   format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
    redirect_to '/posts'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_post
    #   @post = Post.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:job_title, :company, :location, :your_name, :phone)
    end

    def find_post
			@post = Post.find(params[:id])
	end
end
