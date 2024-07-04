class ProblemEntriesController < ApplicationController
  before_action :set_problem_entry, only: %i[ show edit update destroy ]

  # GET /problem_entries or /problem_entries.json
  def index
    @problem_entries = ProblemEntry.all
  end

  # GET /problem_entries/1 or /problem_entries/1.json
  def show
  end

  # GET /problem_entries/new
  def new
    @problem_entry = ProblemEntry.new
  end

  # GET /problem_entries/1/edit
  def edit
  end

  # POST /problem_entries or /problem_entries.json
  def create
    @problem_entry = ProblemEntry.new(problem_entry_params)

    respond_to do |format|
      if @problem_entry.save
        format.html { redirect_to problem_entry_url(@problem_entry), notice: "Problem entry was successfully created." }
        format.json { render :show, status: :created, location: @problem_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @problem_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /problem_entries/1 or /problem_entries/1.json
  def update
    respond_to do |format|
      if @problem_entry.update(problem_entry_params)
        format.html { redirect_to problem_entry_url(@problem_entry), notice: "Problem entry was successfully updated." }
        format.json { render :show, status: :ok, location: @problem_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @problem_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problem_entries/1 or /problem_entries/1.json
  def destroy
    @problem_entry.destroy!

    respond_to do |format|
      format.html { redirect_to problem_entries_url, notice: "Problem entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem_entry
      @problem_entry = ProblemEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def problem_entry_params
      params.require(:problem_entry).permit(:title, :description, :creator_id, :website_url)
    end
end
