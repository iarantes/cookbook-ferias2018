require 'rails_helper'

feature 'Usuario edita uma receita' do
  scenario 'successfully' do
    #cria os dados necessários, nesse caso não vamos criar dados no banco
    cozinha = Cuisine.create(name: 'Arabe')
    tipo_receita = RecipeType.create(name: 'Entrada')
    receita = Recipe.create(title: 'Tabule', cuisine: cozinha, 
                            recipe_type: tipo_receita, cook_time: '30', 
                            difficulty: 'Fácil', ingredients: 'Cebola, Trigo, Tomate, sal, hortelã, azeite e limão', 
                            cook_method: 'Cortar todos os ingredientes, misturar e servir')
    # simula a ação do usuário
    visit root_path
    
    click_on receita.title
    click_on 'Editar'
    fill_in 'Dificuldade', with: 'Médio'
    click_on 'Atualizar'

    expect(current_path).to eq recipe_path(receita.id)
    expect(page).to have_content('Receita atualizada com sucesso')
    expect(page).to have_css('p', text: 'Médio')

  end

  scenario 'unsuccessfuly' do
    #cria os dados necessários, nesse caso não vamos criar dados no banco
    cozinha = Cuisine.create(name: 'Arabe')
    tipo_receita = RecipeType.create(name: 'Entrada')
    receita = Recipe.create(title: 'Tabule', cuisine: cozinha, 
                            recipe_type: tipo_receita, cook_time: '30', 
                            difficulty: 'Fácil', ingredients: 'Cebola, Trigo, Tomate, sal, hortelã, azeite e limão', 
                            cook_method: 'Cortar todos os ingredientes, misturar e servir')
    # simula a ação do usuário
    visit root_path
    
    click_on receita.title
    click_on 'Editar'
    fill_in 'Dificuldade', with: ''
    click_on 'Atualizar'

    expect(page).to have_content('Campos em branco')

  end
end

