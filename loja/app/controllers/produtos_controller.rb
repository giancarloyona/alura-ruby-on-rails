class ProdutosController < ApplicationController

    def new
        @produto = Produto.new
    end

    def index 
        @produtos_por_nome = Produto.order(:nome)
        @produtos_por_preco = Produto.order(:preco).limit(2)
    end

    def create
        valores = params.require(:produto).permit(:nome, :preco, :quantidade, :descricao)
        @produto = Produto.new valores
        if @produto.save
            flash[:notice] = "Produto salvo com sucesso!"
            redirect_to(root_url)
        else
            render :new
        end
    end

    def destroy
        id = params[:id]
        Produto.destroy(id)
        redirect_to(root_url)
    end 

    def busca
        @nome = params[:nome]
        @produtos = Produto.where "nome like ?", "%#{@nome}%"
    end

end