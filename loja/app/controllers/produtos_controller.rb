class ProdutosController < ApplicationController

    def index 
        @produtos_por_nome = Produto.order(:nome)
        @produtos_por_preco = Produto.order(:preco).limit(2)
    end

    def create
        valores = params.require(:produto).permit(:nome, :preco, :quantidade, :descricao)
        produto = Produto.create valores
    end

end