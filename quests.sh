#!/bin/bash
tasks=()
while true; do
    clear
    echo "Basit Görev Takip Uygulaması"
    echo "---------------------------"
    echo "1. Görev Ekle"
    echo "2. Görevleri Listele"
    echo "3. Görevi Tamamla"
    echo "4. Çıkış"
    echo "Seçiminizi giriniz: "
    read choice
    case $choice in
        1)
            echo "Yeni görevi girin: "
            read new_task
            tasks+=("$new_task")
            echo "Görev eklendi."
            sleep 1
            ;;
        2)
            echo "Görevler:"
            for ((i=0; i<${#tasks[@]}; i++)); do
                echo "$(($i+1)). ${tasks[i]}"
            done
            read -p "Devam etmek için bir tuşa basın..."
            ;;
        3)
            echo "Tamamlanmış görevler:"
            for ((i=0; i<${#tasks[@]}; i++)); do
                echo "$(($i+1)). ${tasks[i]}"
            done
            echo "Tamamlamak istediğiniz görevin numarasını girin: "
            read task_number
            if [ $task_number -gt 0 ] && [ $task_number -le ${#tasks[@]} ]; then
                completed_task="${tasks[$(($task_number-1))]}"
                unset 'tasks[$(($task_number-1))]'
                tasks=("${tasks[@]}")
                echo "$completed_task görevi tamamlandı."
            else
                echo "Geçersiz görev numarası."
            fi
            sleep 1
            ;;
        4)
            echo "Çıkış yapılıyor..."
            exit 0
            ;;
        *)
            echo "Hatalı seçim. Tekrar deneyiniz."
            sleep 1
            ;;
    esac
done