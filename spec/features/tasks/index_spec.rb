require 'rails_helper'

RSpec.describe "Index", type: :feature do

  let(:visit_tasks) do
    visit("/")

    visit(tasks_path)
  end

  context "there are tasks" do

    it "Should show all tasks" do
      visit_tasks

      expect(page).to have_content(/Tarea/)
      expect(page).to have_content(/Estado/)
    end

    it "cant Create new tasks without name" do
      visit_tasks

      click_on 'Crear tarea'

      find("input", id: "task_name").set(" ")

      click_on 'Crear Tarea'

      expect(page).to have_content(/Name can't be blank/)
    end

  end

end
