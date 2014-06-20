class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  def index
    @images = Image.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  def new
    @image = Image.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(params[:image])

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render json: @image, status: :created, location: @image }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @image = Image.find(params[:id])
    @image.text = params[:text]
    @image.set_coordinates params[:coordinates]

    if @image.save
      # Image.recreate_versions!
      @image.instance_recreate_versions!
      render nothing: true
      # redirect_to facepalmed_image_path(@image)
      # redirect_to facepalmed_image_path(@image)
    end
  end

# THE FOLLOWING LINES ARE FROM THE STANDARD SCAFFOLDING CODE OF UPDATE (inside the respond_to section)        
      #   format.html { redirect_to @image, notice: 'Image was successfully updated.' }
      #   format.json { head :no_content }
      # else
      #   format.html { render action: "edit" }
      #   format.json { render json: @image.errors, status: :unprocessable_entity }



  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :no_content }
    end
  end

  #UNRESTFUL PART

  def facepalm
    @image = Image.find(params[:id])
  end

  def facepalmed
    @image = Image.find(params[:id])
  end

end




# the original update method:

#   def update
#     @image = Image.find(params[:id])

#     respond_to do |format|
#       if @image.update_attributes(params[:image])
#         format.html { redirect_to @image, notice: 'Image was successfully updated.' }
#         format.json { head :no_content }
#       else
#         format.html { render action: "edit" }
#         format.json { render json: @image.errors, status: :unprocessable_entity }
#       end
#     end
#   end