#!/bin/bash

# Script para compilar o artigo HIDE
echo "Compilando o artigo HIDE..."

# Limpar arquivos anteriores
rm -f access_complete.aux access_complete.bbl access_complete.blg access_complete.log access_complete.pdf

# Primeira compilação
pdflatex -interaction=nonstopmode access_complete.tex

# Executar bibtex
bibtex access_complete

# Segunda compilação
pdflatex -interaction=nonstopmode access_complete.tex

# Terceira compilação (para resolver todas as referências)
pdflatex -interaction=nonstopmode access_complete.tex

echo "Compilação concluída!"

# Verificar se o PDF foi gerado
if [ -f "access_complete.pdf" ]; then
    echo "✅ PDF gerado com sucesso!"
    echo "📄 Verificando número de páginas..."
    
    # Tentar obter o número de páginas (se pdftk ou pdfinfo estiver disponível)
    if command -v pdfinfo &> /dev/null; then
        pages=$(pdfinfo access_complete.pdf | grep "Pages:" | awk '{print $2}')
        echo "📊 Número de páginas: $pages"
    else
        echo "ℹ️  Para verificar o número de páginas, abra o PDF manualmente"
    fi
else
    echo "❌ Erro na compilação - PDF não foi gerado"
    echo "Verificando erros no log..."
    if [ -f "access_complete.log" ]; then
        tail -20 access_complete.log
    fi
fi
