require 'rails_helper'

feature 'Usuario busca receita na home' do
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
    click_on 'Buscar Receita'
    fill_in 'Palavra chave', with: 'Tabule'
    click_on 'Buscar'

    expect(page).to have_content('Foram identificadas as seguintes receitas:')
    expect(page).to have_content(receita.title)
    expect(page).to have_content(receita.cuisine.name)
    expect(page).to have_content(receita.ingredients)
    expect(page).to have_content('Voltar')

  end
end




