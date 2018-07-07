require 'rails_helper'

feature 'Usuario busca receita na home' do
  scenario 'successfully by title' do
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

    expect(page).to have_content ('Resultado da busca por: Tabule')
    expect(page).to have_content(receita.title)
    expect(page).to have_content(receita.cuisine.name)
    expect(page).to have_content(receita.ingredients)
    expect(page).to have_link('Voltar')

  end
end

feature 'Usuario busca duas receitas na home' do
    scenario 'successfully by title' do
      #cria os dados necessários, nesse caso não vamos criar dados no banco
      cozinha = Cuisine.create(name: 'Arabe')
      tipo_receita = RecipeType.create(name: 'Entrada')
      receita = Recipe.create(title: 'Tabule', cuisine: cozinha, 
                              recipe_type: tipo_receita, cook_time: '30', 
                              difficulty: 'Fácil', ingredients: 'Cebola, Trigo, Tomate, sal, hortelã, azeite e limão', 
                              cook_method: 'Cortar todos os ingredientes, misturar e servir')

      receita2 = Recipe.create(title: 'Tabule com queijo', cuisine: cozinha, 
                              recipe_type: tipo_receita, cook_time: '30', 
                              difficulty: 'Fácil', ingredients: 'Cebola, Trigo, Tomate, sal, hortelã, queijo, azeite e limão', 
                              cook_method: 'Cortar todos os ingredientes, misturar e servir')
        visit root_path
        click_on 'Buscar Receita'
        fill_in 'Palavra chave', with: 'Tabule'
        click_on 'Buscar'
        
        
        expect(page).to have_content('Resultado da busca por: Tabule')

        expect(page).to have_content(receita.title)
        expect(page).to have_content(receita.cuisine.name)
        expect(page).to have_content(receita.recipe_type.name)
        expect(page).to have_content(receita.cook_time)
        expect(page).to have_content(receita.ingredients)
        expect(page).to have_content(receita.cook_method)


        expect(page).to have_content(receita2.title)
        expect(page).to have_content(receita2.cuisine.name)
        expect(page).to have_content(receita2.recipe_type.name)
        expect(page).to have_content(receita2.cook_time)
        expect(page).to have_content(receita2.ingredients)
        expect(page).to have_content(receita2.cook_method)

        expect(page).to have_link('Voltar')

    end
  end


