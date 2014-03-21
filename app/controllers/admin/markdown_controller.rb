class Admin::MarkdownController < ApplicationController

  layout 'admin'

  def new
    @markdown_content = MarkdownContent.new(:content => "Edit Me")
    @markdown_content
    @markdown_content.save
  end


  def create
  end


  def show
  end


  def add_image
    md = MarkdownContent.new(content: "test")
    md.save
    i = md.images.create(:image => params[:file])
    render json: { success: true, image_path: i.image.url }
  end

end
