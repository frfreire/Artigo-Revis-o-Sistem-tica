#!/bin/bash

echo "=== TESTE DE COMPILAÇÃO DO ARTIGO HIDE ==="
echo "Data: $(date)"
echo "=============================================="

cd /workspace/hide

echo "1. Verificando arquivos necessários..."
if [ -f "access.tex" ]; then
    echo "✅ access.tex encontrado"
else
    echo "❌ access.tex não encontrado"
    exit 1
fi

if [ -f "references.bib" ]; then
    echo "✅ references.bib encontrado"
else
    echo "❌ references.bib não encontrado"
    exit 1
fi

if [ -f "ieeeaccess.cls" ]; then
    echo "✅ ieeeaccess.cls encontrado"
else
    echo "❌ ieeeaccess.cls não encontrado"
    exit 1
fi

echo ""
echo "2. Tentando compilação rápida..."
echo "Executando: pdflatex access.tex"

# Tentar compilar
if command -v pdflatex >/dev/null 2>&1; then
    echo "pdflatex encontrado, compilando..."
    pdflatex -interaction=nonstopmode access.tex > compile.log 2>&1
    
    if [ $? -eq 0 ]; then
        echo "✅ Compilação bem-sucedida!"
        
        if [ -f "access.pdf" ]; then
            echo "✅ PDF gerado com sucesso"
            ls -lh access.pdf
        else
            echo "⚠️  PDF não encontrado após compilação"
        fi
    else
        echo "❌ Erro na compilação"
        echo "Últimas linhas do log:"
        tail -10 compile.log
    fi
else
    echo "⚠️  pdflatex não disponível no sistema"
    echo "Verificando apenas a sintaxe básica..."
    
    # Verificar se as correções estão no arquivo
    echo ""
    echo "3. Verificando correções implementadas..."
    
    if grep -q "scriptsize" access.tex; then
        echo "✅ scriptsize aplicado nas tabelas"
    else
        echo "❌ scriptsize não encontrado"
    fi
    
    if grep -q "begin{split}" access.tex; then
        echo "✅ Quebra de linha aplicada na equação"
    else
        echo "❌ split não encontrado na equação"
    fi
    
    if grep -q "FIGURA TEMPORÁRIA" access.tex; then
        echo "✅ Figuras temporárias inseridas"
        echo "   Número de figuras: $(grep -c "FIGURA TEMPORÁRIA" access.tex)"
    else
        echo "❌ Figuras temporárias não encontradas"
    fi
    
    if grep -q "tabcolsep}{1" access.tex; then
        echo "✅ Espaçamento de tabelas otimizado"
    else
        echo "❌ Espaçamento de tabelas não otimizado"
    fi
fi

echo ""
echo "4. Estatísticas do documento:"
if [ -f "access.tex" ]; then
    lines=$(wc -l < access.tex)
    words=$(wc -w < access.tex)
    chars=$(wc -c < access.tex)
    
    echo "   Linhas: $lines"
    echo "   Palavras: $words"
    echo "   Caracteres: $chars"
fi

echo ""
echo "=============================================="
echo "Verificação concluída!"
echo "=============================================="
